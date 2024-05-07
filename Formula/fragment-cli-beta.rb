require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5005.0.0-darwin-x64.tar.gz"
    sha256 "5487f3b31a964d1f8612794ea61859f5bbd1fcd75bec4f451cfab5ad9d2fe304"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5005.0.0-darwin-arm64.tar.gz"
      sha256 "4f77a398b855d37cdd7973b0028629e3598ba8342b9d880fd1d17c249af72d21"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5005.0.0-linux-x64.tar.gz"
    sha256 "45439075e4c8ddd819569ea15bd62db079b4c13161801b8c53490e84932c66f3"
  end
  version "5005.0.0"
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
