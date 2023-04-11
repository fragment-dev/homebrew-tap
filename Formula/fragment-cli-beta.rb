require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2401.0.0-darwin-x64.tar.gz"
    sha256 "d690325f071ea5e3f413bc0bda870dfc7492891b058db71865e7a2527866ecc5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2401.0.0-darwin-arm64.tar.gz"
      sha256 "7184a71066a4e0dadf8972ac9421ee8d8f01d0c7b6d8e1f82e13458e5427f234"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2401.0.0-linux-x64.tar.gz"
    sha256 "2ab7e9c57f657b4d912f3d9741870b82e6217d60ae134b3ae4af74581d3d24e7"
  end
  version "2401.0.0"
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
