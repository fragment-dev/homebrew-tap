require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2988.0.0-darwin-x64.tar.gz"
    sha256 "efba71b5ea16bd2ccda27fea7cfda4925c1d02144488869691332d60d42b0cde"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2988.0.0-darwin-arm64.tar.gz"
      sha256 "7a3b98aca18d95a2b3f3fdec491ce913e71520baa8952c884c540deeb15f5ada"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2988.0.0-linux-x64.tar.gz"
    sha256 "089782d26ae7c9f61387f8e0eb1bc367bf2d0b0567fb78ddb481c7b26f5e2a06"
  end
  version "2988.0.0"
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
