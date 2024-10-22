require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5689.0.0-darwin-x64.tar.gz"
    sha256 "c17ca31681bd6bd9a30c59ac9a10fed45d92387ccf0349b77ea71d57d1cad7c8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5689.0.0-darwin-arm64.tar.gz"
      sha256 "c3869264e927ee4fa7ab041ef21a70ffad6261d93169f1a418446eee8e489425"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5689.0.0-linux-x64.tar.gz"
    sha256 "9b9d0bf703091c274d7f3f0180bce9538b9f2dc021d7882506cf5270ed67cb46"
  end
  version "5689.0.0"
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
