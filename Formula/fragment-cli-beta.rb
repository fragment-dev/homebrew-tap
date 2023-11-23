require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4039.0.0-darwin-x64.tar.gz"
    sha256 "ab472e2773066178fe7e383d83f09913ac10ddd599b290ae3b6c237154abd028"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4039.0.0-darwin-arm64.tar.gz"
      sha256 "529202a3c374a3bbb98ace187cf10f9e0b28613328fe0b53396d0c5d1abd5b0a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4039.0.0-linux-x64.tar.gz"
    sha256 "20dcb87f7f912d5beb94d102e647aa74559f41ea3d927a3f7d64ebb028493d46"
  end
  version "4039.0.0"
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
