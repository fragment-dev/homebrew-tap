require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.20-1-darwin-x64.tar.gz"
    sha256 "a351f2338849f4f8dfb01a05e096e35109293f272e1550d6c27310b56108f96c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.20-1-darwin-arm64.tar.gz"
      sha256 "247b14e20e11b22630cbc0240376c6723daf247fa91686073ad0fd6bc06b6114"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.20-1-linux-x64.tar.gz"
    sha256 "f026df8df3410daa7e12dafbe0091db6372d6da360c7c120708b721cbbe9b6de"
  end
  version "2023.9.20-1"
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
