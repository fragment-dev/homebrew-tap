require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5912.0.0-darwin-x64.tar.gz"
    sha256 "e5bb93f15c7d1fd54c1a02da67479fd4870e5f46d9345e7d9b6d5e1e665e7884"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5912.0.0-darwin-arm64.tar.gz"
      sha256 "618009b64836a523f389990d2642ca08b02ebad4c7fa01f64d78dab9b481cc65"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5912.0.0-linux-x64.tar.gz"
    sha256 "85f86517de9794cc3d43cee82b942a4ceda44912a269081ab7553a01acafccf7"
  end
  version "5912.0.0"
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
