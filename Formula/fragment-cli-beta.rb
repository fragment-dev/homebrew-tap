require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4733.0.0-darwin-x64.tar.gz"
    sha256 "714beda0ebd85a4555657f91edfea6a2188e81dc5b050b2a0347975be443a670"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4733.0.0-darwin-arm64.tar.gz"
      sha256 "f08cefb09be02f551250a8ad7e7a1295e06d88cfd8a9789632bcd3e65d879f70"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4733.0.0-linux-x64.tar.gz"
    sha256 "a74a03e6c3f39eec34e29e4e3d8c01d10f3f208a689c2e7771485a5dee0f6060"
  end
  version "4733.0.0"
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
