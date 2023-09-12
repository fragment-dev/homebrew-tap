require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3530.0.0-darwin-x64.tar.gz"
    sha256 "02efbd877153e03a3faee7755e473a8d0645a00f54b162c209ce0aae1bde9b6d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3530.0.0-darwin-arm64.tar.gz"
      sha256 "ee3de70c7836918ecd4147fc0df76f90b7f47609d1a962923207a5f1695f4dd1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3530.0.0-linux-x64.tar.gz"
    sha256 "f356f536a45105b650aeba5a7827ceda55d717c3dcc572204cebf6a848848ab5"
  end
  version "3530.0.0"
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
