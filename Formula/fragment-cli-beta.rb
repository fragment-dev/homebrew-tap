require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4374.0.0-darwin-x64.tar.gz"
    sha256 "2524b686aaa74539006910791fc129b27295f3365789cee69a236474813dd560"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4374.0.0-darwin-arm64.tar.gz"
      sha256 "53a321d6aa2a46b3dc37e8795d0dc5d7cf11c6a65305a45c598f31e36924f7f1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4374.0.0-linux-x64.tar.gz"
    sha256 "65c1668432e3372981ad80a17dca95a6ae16e7ff3d4e87fa6e3cbdb5d39eae30"
  end
  version "4374.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
