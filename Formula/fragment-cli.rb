require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.8-darwin-x64.tar.gz"
    sha256 "97f2986f6bef167009400b98ac0b377ed6c1670de25aa8e62e7f645454e10ce5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.8-darwin-arm64.tar.gz"
      sha256 "c9dad71febc890a7ea57afc9ad5aa1eed81cae8e08ae4e37cdeee320a5f37e37"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.8-linux-x64.tar.gz"
    sha256 "bff1392fe7d2577c72cb685d1855520b9445ccb3beb821075ba1bb5db3bc4564"
  end
  version "2023.9.8"
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
