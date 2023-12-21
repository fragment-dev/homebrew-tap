require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4189.0.0-darwin-x64.tar.gz"
    sha256 "f51a562714f053f79518688f263537c3fc605b4838468f2a01894a8d140e7557"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4189.0.0-darwin-arm64.tar.gz"
      sha256 "ccea68edf93ae3a8a4ba290558b44940956dad2e4bf265924116849d95daddaa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4189.0.0-linux-x64.tar.gz"
    sha256 "e396233f6dd5b65bdfd690fa5caff7aeaf692329faefa92dd65f40bcae27f476"
  end
  version "4189.0.0"
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
