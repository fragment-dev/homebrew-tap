require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3007.0.0-darwin-x64.tar.gz"
    sha256 "98f8dc28bb702040b80466b60373f63a40192dbd2e7a9dc12d973c1c6e0e2644"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3007.0.0-darwin-arm64.tar.gz"
      sha256 "462bd1b66c1c70eb56d7a91827df53b274c5718ec353da2e1093ad0f39fa2e24"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3007.0.0-linux-x64.tar.gz"
    sha256 "e2ea3e8b45c428e8946e3df93a07e30c5fa76cf234004ccca1accb3a84ff0c2f"
  end
  version "3007.0.0"
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
