require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.18-darwin-x64.tar.gz"
    sha256 "541d6681124724df4ddba3bd4b3d845dce5a14824772d43b5cbbc02ad522f37b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.18-darwin-arm64.tar.gz"
      sha256 "6873b704648dfc78542192b19d9fb69126d9a420210b2421eaaf948e12a70bb9"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.18-linux-x64.tar.gz"
    sha256 "f1edc0bf23a62ce99a5414b39107faf854322c1596b9cf8197fb724216c0f8d5"
  end
  version "2024.12.18"
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
