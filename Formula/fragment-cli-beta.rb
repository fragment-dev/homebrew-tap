require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3644.0.0-darwin-x64.tar.gz"
    sha256 "ddda1b6b752bd695c7b95507fd20fe007fb4fe95ee8f6aaec0e190bd055257a4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3644.0.0-darwin-arm64.tar.gz"
      sha256 "a24330180929f4e452292bd3b4659f8595072c83ca2bdf02a09bd8b484163ee3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3644.0.0-linux-x64.tar.gz"
    sha256 "a5eb04aa23aeb8f83cb292c1d051d01feb2f1af673d31763d17eada6a5e5646c"
  end
  version "3644.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
