require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.5-1-darwin-x64.tar.gz"
    sha256 "ffcb7a662abcfc88987d925801bbc53912517e1c62b7e2f61ef6f79340a7e5c5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.5-1-darwin-arm64.tar.gz"
      sha256 "826df6fe26204926fb2dc8225569f6e4ddb8cacddb8c2175d087af70521ca5c5"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.5-1-linux-x64.tar.gz"
    sha256 "1cfe0e7a710a19e581a3b12d079d057a2be2d215bdac95bce9d17cabdaf933d5"
  end
  version "2024.11.5-1"
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
