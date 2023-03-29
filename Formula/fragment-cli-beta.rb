require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2311.0.0-darwin-x64.tar.gz"
    sha256 "e02ecb19126b8b4bea1f526cc6c9a56822d7faf65ba08f69afc8fa371ae86218"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2311.0.0-darwin-arm64.tar.gz"
      sha256 "ed337fdf6c274d59b8a44429b126914e8770fa4c7fdbb4276306c49939714113"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2311.0.0-linux-x64.tar.gz"
    sha256 "fa99d4bf98f35ca78cc3b86842a1d01cdd729a4238138a6f4a8325bf244bbfb2"
  end
  version "2311.0.0"
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
