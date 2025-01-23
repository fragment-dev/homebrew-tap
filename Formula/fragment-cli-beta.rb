require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6115.0.0-darwin-x64.tar.gz"
    sha256 "53b5b53ee59810cd56a85464e133c84c21febbacfd625180106f0c4584a1c898"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6115.0.0-darwin-arm64.tar.gz"
      sha256 "b901a6db49504906b678bd3eef8480bf49016800ad7c723f8dedf4b740a241ab"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6115.0.0-linux-x64.tar.gz"
    sha256 "318bb789053b5d01d4fa98b7be43c7812f5f065e791b2558c3d5cef1b9a9ccf4"
  end
  version "6115.0.0"
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
