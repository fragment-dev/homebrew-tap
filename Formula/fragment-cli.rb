require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.5-darwin-x64.tar.gz"
    sha256 "548fc68c5a07d2295705e3f5f36f20b0f615b4fefee369ac5efb8cad95f3ec26"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.5-darwin-arm64.tar.gz"
      sha256 "815316a3a509a761a76a9c0975af7fb447e77b435ee248ca84e295348fe00bfa"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.5-linux-x64.tar.gz"
    sha256 "017a6c5b613056f7401656f8ec4436dff18631642cefad9dc2c07462a0716fc3"
  end
  version "2024.12.5"
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
