require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.15-darwin-x64.tar.gz"
    sha256 "c4248dc57060dc74ee2a74e7fde36dfe820a7223f6d78ad821669638026c0df6"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.15-darwin-arm64.tar.gz"
      sha256 "5b6ed532179d4de71fe2cf8ab94da51f0407f62bd724584de8fd08024a4fc12a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.15-linux-x64.tar.gz"
    sha256 "cc76dc4eac979dfa1145d132ff1e6010b6531f6192cd4d1594d43d83d9755cf4"
  end
  version "2023.12.15"
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
