require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3634.0.0-darwin-x64.tar.gz"
    sha256 "742c61033437b4b5368bdf5d91d75168f85267fe8af506f903766dcfe9c1ea5a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3634.0.0-darwin-arm64.tar.gz"
      sha256 "be5bd12d925854a50b8c9d21efd62485e02116ed2b908c94cac496978706e858"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3634.0.0-linux-x64.tar.gz"
    sha256 "3352f105849fbd6941ba901abaf7fee4b8d99d2bcade5a2ccebace1e8e1c7d50"
  end
  version "3634.0.0"
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
