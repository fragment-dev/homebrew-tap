require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.21-darwin-x64.tar.gz"
    sha256 "334002924aae6d21bf1a858bc80733ec6b59c7980932ca137a4d3c434fbb7792"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.21-darwin-arm64.tar.gz"
      sha256 "0230543ed6e7fd4f0087a225f5a389ef74af740cd5014cc8497b615a2b1992f5"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.21-linux-x64.tar.gz"
    sha256 "02549e2c3cd7aa12b7fc31e3698cd796fb9bdc3732416b1c8c5bfcd6989e3e6b"
  end
  version "2023.4.21"
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
