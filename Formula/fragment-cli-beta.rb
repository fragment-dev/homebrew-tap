require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5383.0.0-darwin-x64.tar.gz"
    sha256 "80054ac9db9256f10dae50b147133c5377693e446edc32b611ba68d4d1a83e7e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5383.0.0-darwin-arm64.tar.gz"
      sha256 "201f18219c1090977477fcd347ae205a80fd6f7b6ae6cb4d0a04e0e8fe692698"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5383.0.0-linux-x64.tar.gz"
    sha256 "d87360ab616d52f755b76c7b45041991ff82177d85e2da5a2ec1092269b8dc7d"
  end
  version "5383.0.0"
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
