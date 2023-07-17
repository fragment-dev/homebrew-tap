require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.16-darwin-x64.tar.gz"
    sha256 "ef1e0e6dca9aa1c1851e4c9001588ad78303a37ef845df199da4ebcf71541424"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.16-darwin-arm64.tar.gz"
      sha256 "1b6d842277d92e7d16ed605cd3b10a0852ca1068a8e7d147b6f37ab80ef253fd"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.16-linux-x64.tar.gz"
    sha256 "9a1c199d734ad6182d38d7fc015ba47db578bc03ed3d4ec06eb815cc6afa0d8b"
  end
  version "2023.7.16"
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
