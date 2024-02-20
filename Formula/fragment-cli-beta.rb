require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4593.0.0-darwin-x64.tar.gz"
    sha256 "d6ea4510e3e7cc390c6ef77a021e12c205e4c9b641056485c5e2d54ab3d64719"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4593.0.0-darwin-arm64.tar.gz"
      sha256 "4ef46500a89b97f10178e53b4d227c7e634b56a5b26aa35496b58ec29a7be801"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4593.0.0-linux-x64.tar.gz"
    sha256 "29e19beae3008e565677c8d4c44adf36f877ef97d7277ebdd6a1bb08c3f30416"
  end
  version "4593.0.0"
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
