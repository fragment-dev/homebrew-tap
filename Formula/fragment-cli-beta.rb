require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4091.0.0-darwin-x64.tar.gz"
    sha256 "333580b87d356664ce0cc490917673b7c30154818f3af0c6de46c3019932dac4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4091.0.0-darwin-arm64.tar.gz"
      sha256 "df0588c7766c237cdfc0e0ab46f1ba0dd852e33712d9d7ddadd3f4a9c59cc2d3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4091.0.0-linux-x64.tar.gz"
    sha256 "070a6e215c9de799a1f87466964a434c19f4e6dc4147f353696f3c0c37c7e1a1"
  end
  version "4091.0.0"
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
