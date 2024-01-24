require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.24-1-darwin-x64.tar.gz"
    sha256 "05d467028a4c9321fe7a263c29bcf247681fecca5163a8345b969e1f9a3bf2ee"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.24-1-darwin-arm64.tar.gz"
      sha256 "45016192a79153a3c9156d878765d704111633f5fe7ba7b04c92f91b30b078c1"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.24-1-linux-x64.tar.gz"
    sha256 "5a58ec585d76d1358ab3faaa0b4abdd3285032d1d70fe875f80b234ffaf7dd59"
  end
  version "2024.1.24-1"
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
