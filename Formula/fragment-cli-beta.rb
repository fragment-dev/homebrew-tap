require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2806.0.0-darwin-x64.tar.gz"
    sha256 "c09413a7b2a33246427d6483889934873d5d73ce1b6a9fefa53ede586eb648df"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2806.0.0-darwin-arm64.tar.gz"
      sha256 "8d99c5586e2259301925d5231e533758c6f8f263b190846a65a715d4d2f0edff"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2806.0.0-linux-x64.tar.gz"
    sha256 "e5b2ff0eeab6b16e240987abfc435cb130461eaba7968926bb17f47a7d0c5753"
  end
  version "2806.0.0"
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
