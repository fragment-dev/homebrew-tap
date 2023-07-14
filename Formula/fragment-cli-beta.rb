require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3070.0.0-darwin-x64.tar.gz"
    sha256 "957a0b1a9e05828d1af1a14112185c857d31f45fced35d4db0e00c787e0ddee0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3070.0.0-darwin-arm64.tar.gz"
      sha256 "b7cd65f84c7ef82fe7607dcc2edba83caed64945d8445d4049b5aa48b69cc365"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3070.0.0-linux-x64.tar.gz"
    sha256 "4095e7b765c1a0c17306f854709982bb4ba507946a4b5f0d89fae1dd06d80651"
  end
  version "3070.0.0"
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
