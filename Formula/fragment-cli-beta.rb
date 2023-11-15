require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4012.0.0-darwin-x64.tar.gz"
    sha256 "2f54988d422ecad0d42cc6bfdc3130b3dd2261bafa6ee41a250a671c90d748e3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4012.0.0-darwin-arm64.tar.gz"
      sha256 "dd40ef156342209d098aa2d72dbd4bc80ffc85dfd08e6e2a7c3f60e284fbeb15"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4012.0.0-linux-x64.tar.gz"
    sha256 "43119dada890a010ca1ccf876402ce48eac567d9ac6769d8afd082deefafdf17"
  end
  version "4012.0.0"
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
