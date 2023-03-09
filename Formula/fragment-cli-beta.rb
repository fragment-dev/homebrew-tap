require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2168.0.0-darwin-x64.tar.gz"
    sha256 "e09517fa3854c9b5a2d01cef49d99608b15deb935793defd6537b877b63aa582"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2168.0.0-darwin-arm64.tar.gz"
      sha256 "fcc2b64e7fa69ce32d88457593654a64db97562d5e3beeb3524ab8a103349600"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2168.0.0-linux-x64.tar.gz"
    sha256 "394590111dc60644f576cb6f97fdcb5fe2d0ee6a8c384137751d427c67c0ef22"
  end
  version "2168.0.0"
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
