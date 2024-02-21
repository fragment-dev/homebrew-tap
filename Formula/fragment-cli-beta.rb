require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4606.0.0-darwin-x64.tar.gz"
    sha256 "f4c1a1a951727bc6439c0bc2bb66cd785e4919c3f9c5b3dbb7cd056110bc6de5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4606.0.0-darwin-arm64.tar.gz"
      sha256 "d6b28bad94a7bbb47e453c3dda219dd78e97f0c0884a4c204b7196c2524874d1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4606.0.0-linux-x64.tar.gz"
    sha256 "ecbc2d673e1e6baed558a41621fd9d6851e763f1b1cef418e3286aa0422e8ce6"
  end
  version "4606.0.0"
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
