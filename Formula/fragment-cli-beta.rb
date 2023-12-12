require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4143.0.0-darwin-x64.tar.gz"
    sha256 "514c8dfab65442ba2305255082ce821bc9fb1ae6eab151a804adac26933fe4f0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4143.0.0-darwin-arm64.tar.gz"
      sha256 "1593b151d17df3f8e723237ad714a539ae3550bc1974c7c089d4b5835565cd17"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4143.0.0-linux-x64.tar.gz"
    sha256 "99ae8fe0ec4886bc94a699063ad3d57cf1a59092918b849890ea74297cbeb3fe"
  end
  version "4143.0.0"
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
