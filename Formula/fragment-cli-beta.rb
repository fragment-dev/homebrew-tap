require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4972.0.0-darwin-x64.tar.gz"
    sha256 "585dbe31cbb3d9a5c28effe1dadc67210bcb77359391fdc8f3f7a4c72633e06c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4972.0.0-darwin-arm64.tar.gz"
      sha256 "1c3752fa36b445bc7c551d59d45d5d7e1782e113bf3fff7e5be8f9bf31e20456"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4972.0.0-linux-x64.tar.gz"
    sha256 "a3362ff45dcfe3f547f743f3d25a9e8c9fa8f69f68cf81d361fac6f4b35952e0"
  end
  version "4972.0.0"
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
