require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5016.0.0-darwin-x64.tar.gz"
    sha256 "9b38ccdaf866d78d073dce8ed1ca35c1577e83b5d3a1c8b9ca130fa3426eb6ca"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5016.0.0-darwin-arm64.tar.gz"
      sha256 "80a4ab989992ece1c11be8870134e431e8f68df9e306dae9cee54b81bfa57cfa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5016.0.0-linux-x64.tar.gz"
    sha256 "dbe459be50b887c59c6aa188e01dcac1cc77d71df76077a2ff9bafc962862f07"
  end
  version "5016.0.0"
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
