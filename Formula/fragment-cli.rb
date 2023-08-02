require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.2-darwin-x64.tar.gz"
    sha256 "4053b1f092fd95654351cee39e37a572242ca2c992639793e82819e61981ddec"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.2-darwin-arm64.tar.gz"
      sha256 "6872ccb1aba45b6b64d07bd98260de080f893a6a2f6bf9d9d3fcb9cc60b5d0d5"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.2-linux-x64.tar.gz"
    sha256 "4ddfc3beaf40d11965fa4fc88f9a515a546963145c9f8b573c668eea9b50e787"
  end
  version "2023.8.2"
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
