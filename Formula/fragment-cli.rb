require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.26-darwin-x64.tar.gz"
    sha256 "b19b136db09e3778c954238a639af81b777ecf657a3a6a5f563f6ee5608e839c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.26-darwin-arm64.tar.gz"
      sha256 "ec0c085f0021970f99acceeee9f569f61130827ba435cb0e74d0991649e893fd"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.26-linux-x64.tar.gz"
    sha256 "4c405d6024ed5dbcc4beafcde67d07f80dbf9768fc6e286b9008752572680b90"
  end
  version "2023.5.26"
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
