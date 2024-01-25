require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.25-darwin-x64.tar.gz"
    sha256 "49c46e29a8beecac4af51dda6cc83a1255cf8d0c214bff8ef240d70f980763b2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.25-darwin-arm64.tar.gz"
      sha256 "06aca5ce8281c85fbb45a6d370a5049b1a90829a267399b3a279e3c98f090caa"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.25-linux-x64.tar.gz"
    sha256 "89142d5b976eaa04a58c2ee4e4087d6059deea1cbd107b069192dfbe71aaf2bd"
  end
  version "2024.1.25"
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
