require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2669.0.0-darwin-x64.tar.gz"
    sha256 "d0738a5046af2177d17cc95c2dfbe4913030f8bcd589e7b60db8daf88c5ac86a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2669.0.0-darwin-arm64.tar.gz"
      sha256 "268776c41c56040b5a6367ccbcc71ca7a44d8b0bfc5c854e3c50d06ae1a5daa2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2669.0.0-linux-x64.tar.gz"
    sha256 "db606348215cfa6a53b496838745b92885c10df4c6c3abbb4f2ae17375c057a9"
  end
  version "2669.0.0"
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
