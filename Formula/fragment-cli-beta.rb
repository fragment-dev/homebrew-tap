require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3349.0.0-darwin-x64.tar.gz"
    sha256 "f3ccac26a506da05d718e542cb77e09520dbaa1b062b0799eeaba062d81328b0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3349.0.0-darwin-arm64.tar.gz"
      sha256 "a666a12fc15632b429f02505bf10cbb3a983e1293fa4a0d9263b20c39d41289a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3349.0.0-linux-x64.tar.gz"
    sha256 "d437531ca5ef44269cda682c05b8c94ee5b07182c191765857beea09387ed7fc"
  end
  version "3349.0.0"
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
