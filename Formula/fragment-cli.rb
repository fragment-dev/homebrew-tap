require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.24-darwin-x64.tar.gz"
    sha256 "33c0a8a4171fe5c1a7f2859c7ec9d48679c20c85201a86a3acc1931f7877ceee"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.24-darwin-arm64.tar.gz"
      sha256 "741abadb31bcb97cd233822de298e5089f2e62d85e99ca17c35342a3cada5264"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.24-linux-x64.tar.gz"
    sha256 "a7358b8a60346363655e1d6d8101808e8b9aad5400678547b039d17e3895864d"
  end
  version "2023.4.24"
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
