require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5699.0.0-darwin-x64.tar.gz"
    sha256 "6e4689cdee402bc58303dd297c262acd64ddfab051c2f81c082e03130429b16f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5699.0.0-darwin-arm64.tar.gz"
      sha256 "9d67b0bde91196c8d0e2788cc2b980ee7502aee726e40fbff1ea67d6438c5823"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5699.0.0-linux-x64.tar.gz"
    sha256 "07e866ef8978ead5d2a63c41a1eb3e4a07afb0d0c8db2ebfaa6513e99b6bb3dc"
  end
  version "5699.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
