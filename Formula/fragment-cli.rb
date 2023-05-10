require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.10-darwin-x64.tar.gz"
    sha256 "c5c30c4d1eb62b763c96b7c7f16a7e8b82583f6e5434048663452ad39248f0d7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.10-darwin-arm64.tar.gz"
      sha256 "574ac10887f731f1b7cafba23288476c6b91c72535008042d0ade76b66642825"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.10-linux-x64.tar.gz"
    sha256 "3e372c4e459f02aaf92c5439e3980a2a47c9ba4ffbf3e0f66429fba7e62cddb7"
  end
  version "2023.5.10"
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
