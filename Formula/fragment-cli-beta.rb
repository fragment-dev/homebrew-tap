require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3788.0.0-darwin-x64.tar.gz"
    sha256 "b81f91768e36b79ab29e72714b5a40542d3b58e937a13eaf3f389d38aaf0fe5d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3788.0.0-darwin-arm64.tar.gz"
      sha256 "3ab6070ae2d8fb474406f13c845f47c0488d29be910c2e8d1c62884f2928922d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3788.0.0-linux-x64.tar.gz"
    sha256 "4ca10342f0c066fdc341e58dda267cd0592993307e8421e78701897cc4ce63b0"
  end
  version "3788.0.0"
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
