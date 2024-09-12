require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.12-darwin-x64.tar.gz"
    sha256 "a87ecc0f80eee670eb3eca6acd7926cf68be88edb5f000671dcb209c178486a3"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.12-darwin-arm64.tar.gz"
      sha256 "1d9e8ba08801f363e62d5dd8628eb40006ccc0390f9b19f4da9a9233de9c5a96"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.12-linux-x64.tar.gz"
    sha256 "be9bcd23ab28deeb7887a134cd95d359ed6fb5b05aa713ee5119e51e0faa55c9"
  end
  version "2024.9.12"
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
