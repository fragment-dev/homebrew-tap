require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.24-darwin-x64.tar.gz"
    sha256 "fd09a58fd4fe79043f37820ef1bedfc47e0915456d4e61f5fbb291398601281d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.24-darwin-arm64.tar.gz"
      sha256 "d48bc8e558aad97ca3043b218b8e07be88279f621ea952dcef0bd7f84822d6ee"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.24-linux-x64.tar.gz"
    sha256 "5b6b779e50d8af61f265cde525b63d7fac06fbdf5e3436523b3ee886d8e852c0"
  end
  version "2023.10.24"
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
