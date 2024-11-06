require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.6-2-darwin-x64.tar.gz"
    sha256 "abfbdb8793ff97b63bdd5d66d644b73ccd212ddb0116ea0049a945eba66ea369"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.6-2-darwin-arm64.tar.gz"
      sha256 "127322d99898510af5e07ef8d394797729b8e4d31f19022324307adcabedfdcc"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.6-2-linux-x64.tar.gz"
    sha256 "1a6dc172e45179c2e6a569e38710f51743e609dc5f0598fe1a335403113898f6"
  end
  version "2024.11.6-2"
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
