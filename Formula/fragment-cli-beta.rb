require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4681.0.0-darwin-x64.tar.gz"
    sha256 "af7b1920349fb3c2b2e0f7d65ea342b239f8f090cbbcd7cff86fb52dad9f7815"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4681.0.0-darwin-arm64.tar.gz"
      sha256 "ba8f2473e346cf6e5780fade715c4239ab40bcfc1c95dd6bf29cb694e0a6a795"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4681.0.0-linux-x64.tar.gz"
    sha256 "b1f9250de45b6ef957c365b9a4eeaf2c136bfde5114c8df5a9bcba5c2e97c4fb"
  end
  version "4681.0.0"
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
