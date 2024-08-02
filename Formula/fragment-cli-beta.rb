require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5466.0.0-darwin-x64.tar.gz"
    sha256 "db49492ff751d5bb995ce324a910947670909bff2ee39fd3b2f3a409d46e7ecd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5466.0.0-darwin-arm64.tar.gz"
      sha256 "bf27bbe267f6616a44b7faa373fb305802c24fbd311ce201ede04340a6f32928"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5466.0.0-linux-x64.tar.gz"
    sha256 "906cad89874420ed4ae421c7983e415584a700c40ce6b7c90657e0763c5dc279"
  end
  version "5466.0.0"
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
