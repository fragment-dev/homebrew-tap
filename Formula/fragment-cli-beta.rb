require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2443.0.0-darwin-x64.tar.gz"
    sha256 "7cd9b9ab8d48f0fd68916694e8e7e5a52e4f6cbe486f7007e810435345b3407b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2443.0.0-darwin-arm64.tar.gz"
      sha256 "87342fbc7881d35d16167a235876a4dc51301bfa17757e01008e276efb55130a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2443.0.0-linux-x64.tar.gz"
    sha256 "f32c1679b384bab3a5e60983ee3b1b6601c140cf78b6b25d3673f446eaa6ea31"
  end
  version "2443.0.0"
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
