require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4220.0.0-darwin-x64.tar.gz"
    sha256 "9f6ec8eb7703f650c4b5678054bfc0c70909cd234ebfb0a30089d7ebdd926e34"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4220.0.0-darwin-arm64.tar.gz"
      sha256 "952251014a48f413ebffdbe778eb0aac9663e5a6caf993ef00bfcb84df17d298"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4220.0.0-linux-x64.tar.gz"
    sha256 "0b2d270b62ba07883d3dade8aa35123c43858e5f5f5be915a4a67062b8358f5b"
  end
  version "4220.0.0"
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
