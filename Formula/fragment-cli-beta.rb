require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4588.0.0-darwin-x64.tar.gz"
    sha256 "510eb69b0e3721c17552ccbb506ef1169cd8ee9a72c48278538368e1cf90ae8e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4588.0.0-darwin-arm64.tar.gz"
      sha256 "d321ed4affa5055698f4e3742c87a404df412b275baf16214b2a53a8d357a81a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4588.0.0-linux-x64.tar.gz"
    sha256 "7ebfaa3ba9e0cc8ee60dbc2a18ca14987c2ec55e7018a9333c1532e87bf03c29"
  end
  version "4588.0.0"
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
