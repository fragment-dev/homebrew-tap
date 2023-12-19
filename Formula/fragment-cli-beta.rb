require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4163.0.0-darwin-x64.tar.gz"
    sha256 "6d5668b5837bdfe78b7e7e193321a74fabc0566f32866b71f4ba24b545ef4f1c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4163.0.0-darwin-arm64.tar.gz"
      sha256 "50b9256a948565aa099287377ba1de769b5449d83a5f5faf78d82598d8a5808d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4163.0.0-linux-x64.tar.gz"
    sha256 "bd7b305dd1273c9b21e44509a70dd32d7068692db9ab4af27f3ea27fc7addc7d"
  end
  version "4163.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
