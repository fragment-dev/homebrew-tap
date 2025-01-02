require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6025.0.0-darwin-x64.tar.gz"
    sha256 "569fcbb4ce9418869bb9bcf6d9cc0562e4dd82761409dbe6c7669c330dc99dbd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6025.0.0-darwin-arm64.tar.gz"
      sha256 "4a4d29d3d9af14176bf224b51146741004b38404f2704ecbff5ca6c1851221a6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6025.0.0-linux-x64.tar.gz"
    sha256 "a9254d6face294964a6de9958c1ed8a026ad2168a7e0cdb4697c0365297da721"
  end
  version "6025.0.0"
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
