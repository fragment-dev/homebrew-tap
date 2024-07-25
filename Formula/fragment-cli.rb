require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.24-1-darwin-x64.tar.gz"
    sha256 "721ea5649467549fce7ee62b5feae58bed12314177d9abda3b558ad0e4fc9517"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.24-1-darwin-arm64.tar.gz"
      sha256 "37dc3434bc8802cab6e66bf56f5abfdb25a761f3ee5faf183110815e754049b2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.24-1-linux-x64.tar.gz"
    sha256 "91ed22d29dfaeb9916d84c5cefda1470c914fe71809d8c0324ce6237de8616da"
  end
  version "2024.7.24-1"
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
