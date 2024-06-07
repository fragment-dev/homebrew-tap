require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5239.0.0-darwin-x64.tar.gz"
    sha256 "70849444a6d6f57c6216b4ec3fb8f68a01a43704622a64dec6797ede17fa6a59"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5239.0.0-darwin-arm64.tar.gz"
      sha256 "39e448cfa4972df2d01c4ba93cc46fd3e8b7e95653b509c87f35e054d6a92d19"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5239.0.0-linux-x64.tar.gz"
    sha256 "40eab0f50ddfe58ae97e38a7989c494edc4401be38885c6c1b00f7ca0e2b4132"
  end
  version "5239.0.0"
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
