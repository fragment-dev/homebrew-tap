require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.18-darwin-x64.tar.gz"
    sha256 "1bc61ac32a9e11b774c0170cfbe63defb1de460e57948b05c2458534c5df548f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.18-darwin-arm64.tar.gz"
      sha256 "62081e5cd292cca0398ab06b10927ab24cd0792e697f34487142c163e01361d4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.18-linux-x64.tar.gz"
    sha256 "db2d827b4b9f116e2654d5fd5b753f13c63ae3552702faa6b1f65c5859a0d348"
  end
  version "2023.10.18"
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
